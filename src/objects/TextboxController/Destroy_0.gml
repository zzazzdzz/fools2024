ds_stack_pop(global.textStack);
if (!ds_stack_empty(global.textStack)){
    obj = ds_stack_top(global.textStack);
    with(obj) active = true;
}else{
    global.active = global.activeStored;
}
global.textStackWait = true;