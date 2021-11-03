; Octolapse required code start ----
; Script based on an original created by tjjfvi (https://github.com/tjjfvi)
; An up-to-date version of the tjjfvi's original script can be found
; here:  https://csi.t6.fyi/
; Note - This script will only work in Cura V4.2 and above!
; --- Global Settings
; layer_height = {layer_height}
; smooth_spiralized_contours = {smooth_spiralized_contours}
; magic_mesh_surface_mode = {magic_mesh_surface_mode}
; machine_extruder_count = {machine_extruder_count}
; --- Single Extruder Settings
; speed_z_hop = {speed_z_hop}
; retraction_amount = {retraction_amount}
; retraction_hop = {retraction_hop}
; retraction_hop_enabled = {retraction_hop_enabled}
; retraction_enable = {retraction_enable}
; retraction_speed = {retraction_speed}
; retraction_retract_speed = {retraction_retract_speed}
; retraction_prime_speed = {retraction_prime_speed}
; speed_travel = {speed_travel}
; Octolapse required code end ------

;-- BL-TOUCH START GCODE --
G21 ; metric values
G90 ; absolute positioning
M82 ; set extruder to absolute mode
M107 ; start with the fan off

; confirm BL-touch safety
M280 P0 S160 ; BL-Touch Alarm release
G4 P100 ; Delay for BL-Touch homing
G28 X0 Y0 ; move X/Y to min endstops
G28 Z0 ; move Z to min endstops

; reconfirm BL-touch safety
M280 P0 S160 ; BL-Touch Alarm release
G4 P100 ; Delay for BL-Touch

; bed leveling
G29; Auto leveling
M420 Z5 ; set LEVELING_FADE_HEIGHT
M500 ; save data of G29 and M420
M420 S1 ; enable bed leveling

; add the "Intro Line"
G1 X20 Y20.0 ; Go to the front left corner
G92 E0                   ;zero the extruded length
G1 Z1 F1000              ;move up slightly
G1 Y20.0 Z0 E9.0 F1000.0 ;intro line
G1 Y100.0 E21.5 F1000.0  ;continue line

; prepare hot-end
G92 E0 ; zero the extruded length
G1 F200 E3 ; extrude 3mm of feed stock
G92 E0 ; zero the extruded length again
M117 Printing
; -- end of BL-TOUCH START GCODE --
