/// @description animate movement to animTargetX,animTargetY in AnimTargetSteps

animTargetDeltaX = (animTargetX - x) / animTargetSteps;
animTargetDeltaY = (animTargetY - y) / animTargetSteps;
animTargetOrigAnim = animIndex;
animIndex = "Walk";
animSpeed = 0.25;
event_user(0);