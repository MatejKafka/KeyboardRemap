"""
Small script that remaps an extra M key on my gamepad to LWin, which is missing for some reason.
Uses https://github.com/cobrce/interception_py.
"""

from interception_py.interception import *

GAMEPAD_HWID = b'HID\\VID_0C45&PID_764E&REV_0103&MI_00\x00HID\\VID_0C45&PID_764E&MI_00\x00' \
    + b'HID\\VID_0C45&UP:0001_U:0006\x00HID_DEVICE_SYSTEM_KEYBOARD\x00HID_DEVICE_UP:0001_U:0006\x00HID_DEVICE\x00\x00'

if __name__ == "__main__":
    c = interception()
    
    # FIXME: does not update on dis/reconnect
    gamepad_id = None
    for i in range(MAX_KEYBOARD):
        if c.get_HWID(i).encode() == GAMEPAD_HWID: gamepad_id = i
    if gamepad_id == None:
        raise Exception("Could not find gamepad device ID")
    
    c.set_filter(interception.is_keyboard,
            interception_filter_key_state.INTERCEPTION_FILTER_KEY_ALL.value)
    
    while True:
        device = c.wait()
        stroke = c.receive(device)
        
        # replace M on gamepad with LWin
        if type(stroke) is key_stroke and device == gamepad_id and stroke.code == 50:
            stroke.code = 0x5b
            stroke.state += 2
        
        c.send(device, stroke)