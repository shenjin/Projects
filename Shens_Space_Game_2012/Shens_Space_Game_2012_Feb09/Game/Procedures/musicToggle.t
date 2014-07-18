%Music Toggle
proc playmusic
    if musicstatus = " Music Off " then
	Music.PlayFileLoop ("Game/Music/Halo.mp3")
	musicstatus := " Music  On "
    else
	Music.PlayFileStop
	musicstatus := " Music Off "
    end if
end playmusic
