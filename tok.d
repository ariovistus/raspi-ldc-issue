import deimos.python.object;
import std.stdio;
void main() 
{
	writeln("tacos");
	// DustMiteNoRemoveStart
	assert(PyTypeObject.tp_as_buffer.offsetof == 80);
	assert(PyTypeObject.tp_as_buffer.sizeof == 4);
	assert(PyTypeObject.tp_flags.offsetof == 88);
	// DustMiteNoRemoveStop
}
