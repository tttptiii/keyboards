s.boot;

(
var notes, on, off;

MIDIClient.init;
MIDIIn.connectAll;

notes = Array.newClear(128);    // array has one slot per possible MIDI note

on = MIDIFunc.noteOn({
	|veloc, num, chan, src|
	notes[num] = Synth(\default,
		[
			\freq, num.midicps,
			\amp, veloc * 0.010
		]
	);
});

off = MIDIFunc.noteOff({
	|veloc, num, chan, src|
	notes[num].release;
});
)

(
s.recHeaderFormat="wav";
s.record(path: Document.current.dir+/+"%-keyboard01.wav".format(Date.getDate.dayStamp);
)

s.stopRecording;
