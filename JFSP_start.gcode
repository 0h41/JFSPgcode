; *-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*
; | FOR ALL LEGAL PURPOSES, THIS DOCUMENT IS A JOKE AND IS DEFINITELY NOT SOMETHING TO BE USED FOR A MACHINE OF ANY KIND, ESPECIALLY NOT FOR 3D PRINTER OR CNC MACHINE OF ANY SORT, AND SHOULD NOT BY USED BY ANYONE, ANYWHERE, EVER! |
; *-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*
;
; ABSOLUTELY, POSITIVELY, 100% DO NOT USE THIS IF YOU DON'T UNDERSTAND EVERY SINGLE LINE OF THIS DOCUMENT AND/OR YOU DON'T KNOW WHAT YOU ARE DOING AND/OR YOU ARE NOT WILLING TO DEAL WITH THE CONSEQUENCES!
; YOU CAN SAFELY ASSUME THAT THIS WHOLE DOCUMENT WAS CREATED BY A RANDOM BLABBERING MORON FROM THE INTERNET THAT HAS NO IDEA WHAT HE'S DOING!
; YOU PRINTER MAY (AND IF YOU ARE SCARED OF ANY OF THIS, PROBABLY WILL) BREAK AND BE PERMANENTLY DAMAGED BY USING THIS!
; IF YOU WANT YOUR PRINTER TO "Just Work (TM)", JUST LEAVE ALL THE GCODES AS THEY ARE FROM FACTORY!
;
; IF YOU AS FAR AS THINK OF BLAMING ANYONE OTHER THAN YOURSELF, INCLUDING THE AUTHOR OF THIS DOCUMENT, FOR ANY CONSEQUENCES OF USING IT IN ANY WAY, SHAPE OR FORM, YOU WILL BE IGNORED AND MADE FUN OF!
;
; All that said:
; "Just F***ing Start Printing" custom start gcode for Bambu Lab P1S 3d printer.
;
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
; !!!!! This code assumes that the printer is properly calibrated and homed, and the Z axis is not too close to the nozzle beforehand. DO NOT USE IT OTHERWISE !!!!!
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;
; If you used stock start gcode for a succesfull print and the printer was kept powered, you should be good to go. IF YOU ARE NOT SURE IF THE PRINTER KEPT POWER, DON'T USE THIS!
;
; Creating this gcode was motivated by the need to print thin, wide prints that are fast, but take the whole print bed.
; Without this, calibration took longer than printing and a lot of filament was wasted on purges.
; Print quality should stay the same as your print with stock gcode you just did, unless you do something that will make your homing/calibration obsolete.
; Light ooze from the nozzle before printing should not be a big problem, as it should just stick to the purge line.
;
; ONCE AGAIN, FOR THE LOVE OF ALL THAT IS CAPABLE OF IT, DON'T USE IT!

M140 S[bed_temperature_initial_layer_single]; preheat bed
M104 S{nozzle_temperature_initial_layer[initial_extruder]} ; preheat nozzle

; Keep some resets from original gcode
M17 X1.2 Y1.2 Z0.75                         ; reset motor current to default
G90                                         ; absolute positioning
M83                                         ; relative extrusion (override G90)
M220 S100                                   ; reset Feedrate
M221 S100                                   ; reset Flowrate
M73.2   R1.0                                ; reset "time left"
M1002 set_gcode_claim_speed_level : 5       ; set speed to "normal"
M204 S10000                                 ; set scceleration to 10m/s^2
M412 S1                                     ; enable filament runout detection
M975 S1                                     ; turn on vibration supression
T1000                                       ; kept from original gcode, possibly "select tool 1000" even though we only have one tool ¯\_(ツ)_/¯

; do a shortened purge line
G1 X100 Y1.0 Z0.8 F18000                   ; move to start position of filament purge line
M190 S[bed_temperature_initial_layer_single]; wait for bed temperature
M109 S{nozzle_temperature_initial_layer[initial_extruder]} ; wait for nozzle temperature
G1 Z0.2
G0 E2 F300
G0 X240 E9.5 F{outer_wall_volumetric_speed/(0.3*0.5) * 60}
G0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X140 E6.75 F{outer_wall_volumetric_speed/(0.3*0.5) * 60} ; even shorter return path to avoid bumping into initial blob
M400                                        ; wait for all previous stuff to finish

; last preparations
{if curr_bed_type=="Textured PEI Plate"}
G29.1 Z{-0.04}                              ; lower nozzle for Textured PEI Plate as homing is relative to the sticking out texture
{endif}
M1002 gcode_claim_action : 0                ; signal printing to software
M106 S0                                     ; turn off fan
M106 P2 S0                                  ; turn off big fan
M106 P3 S0                                  ; turn off chamber fan
M975 S1                                     ; vibration suppresion again, repeated here just like in original gcode

; ABSOLUTELY, POSITIVELY, 100% DO NOT USE THIS IF YOU DON'T UNDERSTAND EVERY SINGLE LINE OF THIS DOCUMENT AND/OR YOU DON'T KNOW WHAT YOU ARE DOING AND/OR YOU ARE NOT WILLING TO DEAL WITH THE CONSEQUENCES!
; YOU CANE SAFELY ASSUME THAT THIS WHOLE DOCUMENT WAS CREATED BY A RANDOM BLABBERING MORON FROM THE INTERNET THAT HAS NO IDEA WHAT HE'S DOING!
; YOU PRINTER MAY (AND IF YOU ARE SCARED OF ANY OF THIS, PROBABLY WILL) BREAK AND BE PERMANENTLY DAMAGED BY USING THIS!
; IF YOU WANT YOUR PRINTER TO "Just Work (TM)", JUST LEAVE ALL THE GCODES AS THEY ARE FROM FACTORY!
;
; IF YOU AS FAR AS THINK OF BLAMING ANYONE OTHER THAN YOURSELF, INCLUDING THE AUTHOR OF THIS DOCUMENT, FOR ANY CONSEQUENCES OF USING IT IN ANY WAY, SHAPE OR FORM, YOU WILL BE IGNORED AND MADE FUN OF!
;
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
; !!!!! This code assumes that the printer is properly calibrated and homed, and the Z axis is not too close to the nozzle beforehand. DO NOT USE IT OTHERWISE !!!!!
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;
; ONE LAST WARNING, JUST QUIT WHILE YOU ARE AHEAD AND DON'T USE THIS!
;
; *-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*
; | FOR ALL LEGAL PURPOSES, THIS DOCUMENT IS A JOKE AND IS DEFINITELY NOT SOMETHING TO BE USED FOR A MACHINE OF ANY KIND, ESPECIALLY NOT FOR 3D PRINTER OR CNC MACHINE OF ANY SORT, AND SHOULD NOT BY USED BY ANYONE, ANYWHERE, EVER! |
; *-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*
