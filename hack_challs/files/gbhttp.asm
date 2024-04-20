def STATUS_INIT            equ 0
def STATUS_WAITING_FOR_REQ equ 1
def STATUS_RECEIVED_REQ    equ 2
def STATUS_DONE            equ 3

SECTION "WRAM0", WRAM0[$C000]
wRequestData:
    ds $800
wResponseData:
    ds $800

SECTION "WRAM1", WRAMX[$D000]
wResponseHeaders:
    ds $200
wResponseOutput:
    ds $800
wScratchBuffer:
    ds $200
wStack:
    ds $100
wStackEnd:

SECTION "HRAM", HRAM[$FF80]
hDriverStatus:
    ds 1
hASCIINumber:
hThousands:
    ds 1
hHundreds:
    ds 1
hTens:
    ds 1
hOnes:
    ds 1
hNullTerminator:
    ds 1
hParameterPtr:
    ds 2

SECTION "ROM", ROM0[$00FE]
    ; Make sure crashes don't reset.
    ld b, b
    rst $38
    ; This is where execution starts.
    di
    jp EntryPoint
    ds $150 - @, 0

EntryPoint:
    ; Clear HRAM
    xor a
    ld c, 16
    ld hl, $FF80
.clearHRAM
    ld [hli], a
    dec c
    jr nz, .clearHRAM
    ; Set up the stack
    ld sp, wStackEnd
    ; Clear all memory
    call ClearWRAM
.waitForHarness
    ; Wait for harness to write request data
    ld a, STATUS_WAITING_FOR_REQ
    ldh [hDriverStatus], a
.waitForHarness_loop
    ldh a, [hDriverStatus]
    cp STATUS_RECEIVED_REQ
    jr nz, .waitForHarness_loop
.checkLineLengths
    ; Limit all request lines to 256 characters
    ld hl, wRequestData
    ld c, 0
.checkLineLengths_loop
    ld a, [hli]
    inc c
    ; Error 413 if counter got to 256 
    jp z, E413_RequestEntityTooLarge
    ; Reset counter on start of new request line
    cp $0a
    jr z, .checkLineLengths_resetCounter
    cp $0d
    jr z, .checkLineLengths_resetCounter
    ; Finish checking on null byte
    and a
    jr z, .getPath
    jr .checkLineLengths_loop
.checkLineLengths_resetCounter
    ld c, 0
    jr .checkLineLengths_loop
.getPath
    ; Get HTTP request method (component until " ").
    ld hl, wRequestData
    ld bc, "  "
    call _ScanUntil_
    ; Bad request if terminator was hit.
    jp c, E400_BadRequest
    ; Get HTTP path (component until "?" or " ")
    ld bc, "? "
    call _ScanUntil_
    ; Bad request if terminator was hit.
    jp c, E400_BadRequest
    ; Save pointer to params (component after "?")
    ld a, l
    ld [hParameterPtr], a
    ld a, h
    ld [hParameterPtr+1], a
.findRoute
    ; Go through all routes.
    ld hl, AppRoutes
    ld a, [hli]
    ld c, a
.checkRoute
    ; Save pointer to route list
    push hl
    ; Get pointer to route path
    ld a, [hli]
    ld h, [hl]
    ld l, a
    ; Compare it with request path
    ld de, wScratchBuffer
    call _StrEq_
    ; Check next one if it's different
    jr c, .checkNextRoute
    ; Execute this route otherwise.
    pop hl
    inc hl
    inc hl
    ; Get route handler pointer.
    ld a, [hli]
    ld h, [hl]
    ld l, a
    ; Run it.
    jp hl
.checkNextRoute
    ; Restore route list and move it forward
    pop hl
    inc hl
    inc hl
    inc hl
    inc hl
    ; Check next route if there's one
    dec c
    jr nz, .checkRoute
    ; Error 404 if route is not found.
    jp E404_NotFound

AppRoutes:
    ; Number of routes.
    db 3
    ; Route entries.
    dw AppPath_Root, AppRoute_Root
    dw AppPath_Secret, AppRoute_Secret
    dw AppPath_Public, AppRoute_Public
AppPath_Root:
    db "/", 0
AppPath_Secret:
    db "/secret", 0
AppPath_Public:
    db "/public", 0

; This is the application's main page.
AppRoute_Root:
    ; Copy the document.
    ld de, wResponseOutput
    ld hl, .content
    call _StrCpy_
    ; Copy the headers.
    ld de, wResponseHeaders
    ld hl, .headers
    call _StrCpy_
    ; Finalize.
    jp FinalizeResponse
.headers
    db "HTTP/1.0 200 OK\r\n"
    db 0
.content
    db """
<!DOCTYPE html>
<style>
body \{ text-align: center; \}
</style>

<h1>Hello! I'm a server!</h1>
<p>And I'm running on the superior GBZ80 architecture!</p>

<form method='get' action='/public'>
<input type='submit' value='Go to the public area'>
</form>
    """
    ; RGBDS silently cuts multiline strings to 255 bytes.
    ; Not sure if bug or feature
    db """
<br>
<form method='get' action='/secret'>
<input type='text' value='Enter password' name='p'>
<input type='submit' value='Go to the secret area'>
</form>
    """
    db 0

; This is the application's secret page.
AppRoute_Secret:
    ; Get pointer to params in URL
    ld a, [hParameterPtr]
    ld l, a
    ld a, [hParameterPtr+1]
    ld h, a
    ; Run URL decoding.
    call URLDecode
    ; Check if param string matches expected one
    ld de, wScratchBuffer
    ld hl, .validPassword
    call _StrEq_
    ; Load a page depending on password check
    ld hl, .contentWrong
    jr c, .wrongPW
.correctPW
    ld hl, .contentCorrect
.wrongPW
    ; Copy the document.
    ld de, wResponseOutput
    call _StrCpy_
    ; Copy the headers.
    ld de, wResponseHeaders
    ld hl, .headers
    call _StrCpy_
    ; Finalize.
    jp FinalizeResponse
.headers
    db "HTTP/1.0 200 OK\r\n"
    db 0
.validPassword
    ; This is changed on production!
    db "p=Pa$$W0rD123", 0
.contentCorrect
    db """
<!DOCTYPE html>
<style>body \{ text-align: center; \}</style>
<h1>Congrats! This is the correct password!</h1>
<p>Here's some secret content. <a href='/'>Go back</a></p>
    """
    db 0
.contentWrong
    db """
<!DOCTYPE html>
<style>body \{ text-align: center; \}</style>
<h1>Oops! The password is wrong!</h1>
<p>Try entering the correct one next time! <a href='/'>Go back</a></p>
    """
    db 0

; This is the application's public page.
AppRoute_Public:
    ; Copy the document.
    ld de, wResponseOutput
    ld hl, .content
    call _StrCpy_
    ; Copy the headers.
    ld de, wResponseHeaders
    ld hl, .headers
    call _StrCpy_
    ; Finalize.
    jp FinalizeResponse
.headers
    db "HTTP/1.0 200 OK\r\n"
    db 0
.content
    db """
<!DOCTYPE html>
<style>
body \{ text-align: center; \}
</style>

<h1>This is an example public page</h1>
<p>It's available to everyone. <a href='/'>Go back</a></p>
    """
    db 0

; Handle Error 400: Bad Request
E400_BadRequest:
    ; Copy the document.
    ld de, wResponseOutput
    ld hl, .document400
    call _StrCpy_
    ; Copy the headers.
    ld de, wResponseHeaders
    ld hl, .headers
    call _StrCpy_
    ; Finalize.
    jp FinalizeResponse
.headers
    db "HTTP/1.0 400 Bad Request\r\n"
    db 0
.document400:
    db "<h1>400 Bad Request</h1>"
    db "<p>Your request seems to be invalid.</p>"
    db 0

; Handle Error 404: Not Found
E404_NotFound:
    ; Copy the document.
    ld de, wResponseOutput
    ld hl, .document404
    call _StrCpy_
    ; Copy the headers.
    ld de, wResponseHeaders
    ld hl, .headers
    call _StrCpy_
    ; Finalize.
    jp FinalizeResponse
.headers
    db "HTTP/1.0 404 Not Found\r\n"
    db 0
.document404:
    db "<h1>404 Not Found</h1>"
    db "<p>This route is not mapped to any action.</p>"
    db 0

; Handle Error 413: Request Entity Too Large
E413_RequestEntityTooLarge:
    ; Copy the document.
    ld de, wResponseOutput
    ld hl, .document413
    call _StrCpy_
    ; Copy the headers.
    ld de, wResponseHeaders
    ld hl, .headers
    call _StrCpy_
    ; Finalize.
    jp FinalizeResponse
.headers
    db "HTTP/1.0 413 Request Entity Too Large\r\n"
    db 0
.document413:
    db "<h1>413 Request Entity Too Large</h1>"
    db "<p>Request lines cannot exceed 256 bytes.</p>"
    db 0

; Send a completed HTTP response.
FinalizeResponse:
    ; Get length of output in BC
    ld hl, wResponseOutput
    call _StrLen_
    ld b, b
    ; Make a Content-Length header in wScratchBuffer
    call MakeContentLengthHeader
    ; Send response headers
    ld de, wResponseData
    ld hl, wResponseHeaders
    call _StrCpy_
    ; Send Server header
    ld de, wResponseData
    ld hl, .serverHeader
    call _StrCat_
    ; Send Content-Length header
    ld de, wResponseData
    ld hl, wScratchBuffer
    call _StrCat_
    ; Send CRLF after headers
    ld de, wResponseData
    ld hl, CrLf
    call _StrCat_
    ; Send content
    ld de, wResponseData
    ld hl, wResponseOutput
    call _StrCat_
    ; Notify the harness that the job is finished
    ld a, STATUS_DONE
    ldh [hDriverStatus], a
.forever
    ld b, b
    jr .forever
.serverHeader
    db "Server: gbhttp (backend)\r\n"
    db 0

; Make a "Content-Length: <value in BC>" header
MakeContentLengthHeader:
    ; Start with a prefix
    ld de, wScratchBuffer
    ld hl, .contentLengthHeader
    call _StrCpy_
    ; Convert BC to ASCII string
    call NumToASCII
    ; Append it to buffer
    ld de, wScratchBuffer
    ld hl, hASCIINumber
    call _StrCat_
    ; Append CRLF to buffer and return
    ld de, wScratchBuffer
    ld hl, CrLf
    jp _StrCat_
.contentLengthHeader:
    db "Content-Length: "
    db 0

; Helper macro for NumToASCII
MACRO count_n
    ld e, 0
.count\@
    ; Subtract a power of ten
    ld bc, \1
    add hl, bc
    ; Bit 7 set = negative value
    bit 7, h
    jr nz, .overflow\@
    ; Keep counting if no overflow
    inc e
    jr .count\@
.overflow\@:
    ; Undo the last subtraction
    ld bc, \2
    add hl, bc
    ; Save result to correct address
    ld a, e
    ldh [\3], a
ENDM

; Convert the number in BC into ASCII string at hASCIINumber
NumToASCII:
    ; Terminate the string first
    xor a
    ldh [hNullTerminator], a
    ; Count each power
    ld h, b
    ld l, c
    count_n -1000, 1000, hThousands
    count_n -100,  100,  hHundreds
    count_n -10,   10,   hTens
    ld a, l
    ld [hOnes], a
    ; Make the values into ASCII numbers
    ldh a, [hThousands]
    add "0"
    ldh [hThousands], a
    ldh a, [hHundreds]
    add "0"
    ldh [hHundreds], a
    ldh a, [hTens]
    add "0"
    ldh [hTens], a
    ldh a, [hOnes]
    add "0"
    ldh [hOnes], a
    ; Drop the first digit if it's zero
.dropDigits
    ldh a, [hThousands]
    cp "0"
    jr nz, .noZero
    ldh a, [hHundreds]
    ldh [hThousands], a
    ldh a, [hTens]
    ldh [hHundreds], a
    ldh a, [hOnes]
    ldh [hTens], a
    xor a
    ldh [hOnes], a
    ; Continue dropping digits if they're zero
    jr .dropDigits
.noZero
    ret

; Decode URL-encoded string in HL into wScratchBuffer
URLDecode:
    ld de, wScratchBuffer
.read
    ; Get byte
    ld a, [hli]
    ; Check for terminating characters
    and a
    jr z, .done
    cp $0a
    jr z, .done
    cp $0d
    jr z, .done
    cp " "
    jr z, .done
    ; Check for "+" (needs to be replaced with space)
    cp "+"
    jr z, .space
    ; Check for escape character "%"
    cp "%"
    jr z, .escape
    ; If not any of those, just copy
    ld [de], a
    inc de
    jr .read
.escape
    ; Escape char. Get the first half
    ld a, [hli]
    call .getHex
    swap a
    ld b, a
    ; Get the second half
    ld a, [hli]
    call .getHex
    ; Mix the previous half in
    or b
    ; We have a byte to copy
    ld [de], a
    inc de
    jr .read
.space
    ; "+" char. Just copy a space
    ld a, " "
    ld [de], a
    inc de
    jr .read
.done
    ; Terminate the result before leaving
    xor a
    ld [de], a
    ret
.getHex
    push hl
    ld hl, .table
    ; Number of items in the table
    ld c, 16 + 6
.try
    ; Is it the one?
    cp [hl]
    jr z, .got
    ; Go next if not
    inc hl
    inc hl
    dec c
    jr nz, .try
    ; Sentinel will be read if item not found
.got
    inc hl
    ld a, [hl]
    pop hl
    ret
.table
    ; Translation from ASCII to nibbles
    db "0", $0, "1", $1, "2", $2, "3", $3
    db "4", $4, "5", $5, "6", $6, "7", $7
    db "8", $8, "9", $9, "A", $a, "B", $b
    db "C", $c, "D", $d, "E", $e, "F", $f
    db "a", $a, "b", $b, "c", $c, "d", $d
    db "e", $e, "f", $f
    ; Sentinel
    db 0, 0

; Clears all WRAM with 0, excluding stack
ClearWRAM:
    ld bc, wStack - $c000
    ld hl, $c000
.clear
    xor a
    ld [hli], a
    dec bc
    ld a, c
    or b
    jr nz, .clear
    ret

; ASCII <CR><LF>, used in multiple places
CrLf:
    db $0d,$0a,$00

; Concatenate string in HL to string in DE.
_StrCat_:
    ld a, [de]
    and a
    jr z, _StrCpy_
    inc de
    jr _StrCat_

; Copy string HL to DE.
_StrCpy_:
    ld a, [hli]
    ld [de], a
    inc de
    and a
    ret z
    jr _StrCpy_

; Get length of string in HL, store it in BC.
_StrLen_:
    ld bc, 0
.loop
    ld a, [hli]
    and a
    ret z
    inc bc
    jr .loop

; Read characters into wScratchBuffer, until either:
; - Null terminator is hit
; - CR or LF are hit
; - Characters defined in regs B and C are hit
; Set carry flag if reading was interrupted by 00,0A,0D
_ScanUntil_:
    push de
    ld de, wScratchBuffer
.loop
    ld a, [hli]
    ld [de], a
    inc de
    ; Check characters from B, C
    cp b
    jr z, .got
    cp c
    jr z, .got
    ; Check 0x0A and 0x0D
    cp $0a
    jr z, .term
    cp $0d
    jr z, .term
    ; Check null byte
    and a
    jr z, .term
    jr .loop
.got
    dec de
    or a
    jr .leave
.term
    scf
    ; Fall through to .leave
.leave
    xor a
    ld [de], a
    pop de
    ret

; Test if strings at HL and DE are equal.
; Set carry if not equal, unset carry if equal
_StrEq_:
    push bc
.test
    ld b, [hl]
    ld a, [de]
    cp b
    jr z, .eq
    jr .resultNeq
.chk
    inc hl
    inc de
    jr .test
.eq
    and a
    jr z, .resultEq
    jr .chk
.resultEq
    pop bc
    or a
    ret
.resultNeq
    pop bc
    scf
    ret