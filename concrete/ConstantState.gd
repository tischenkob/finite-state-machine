extends State


func _ready():
	self._body = get_parent()

func _physics_process(delta):
	_update(delta)
