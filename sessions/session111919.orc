
start("ReverbMixer")
giBEncode = 1 ;Render B-format alongside stereo render? (1 = yes, 0 = no)
; samples 109, 52

instr g1 
irand = random(1,118) ;iranddur=random(0.2,9)
irandpitch=random(-2, 4)
Sample = sound("tone", 8)
Smachine = "grain"
idur =30 
kamp = 0.2
ichance = 0.999
kpitch[] fillarray 0.2,0.27, idur ;maps to trilfo // lo, hi rate.
kstr[] fillarray 0.2, 6, idur ;maps to trilfo // lo, hi rate.
kgrd[] fillarray 15, 5, idur ;2 to 32
kgrs[] fillarray 0.1, 0.1, idur 	;0.1 to 1 
seq(kamp, ichance, Smachine, Sample,idur,kpitch,kstr,kgrd,kgrs)
;\schedule(p1,idur,1)
prints "Sample: %i %s Number: %i \n", p1, Sample,irand
;render("grain")
kdelay=0.4
kfb=0.4
kdpitch=linseg(1,idur, 0.5)
kmix=0.5
adelL, adelR pdelay "grain",kdelay,kfb,kdpitch,kmix
kalpha line 0, p3, 720
kbeta randh 100, 2
;mixencoded(adelL, adelR, kalpha, kbeta)
reverb_mix(adelL,adelR,0.9)
endin

schedule("g1", 0, 30)

