extends Node

@export var filename : String = "leaderboard.txt"
var _prefix : String = "user://"

func calcultate_score():
	pass

func get_leaderboard():
	var savefile = FileAccess.open(_prefix+filename, FileAccess.READ)
	var list = []
	while savefile.get_position() < savefile.get_length():
		var line = savefile.get_line()
		print("line"+line)
		list.append(line)
	return list

func add_score(name : String, score : int):
	var savefile = FileAccess.open(_prefix+filename, FileAccess.READ_WRITE)
	var line = name+";"+str(score)
	savefile.store_line(line)
