import std.stdio;

struct PyObject {
        int ob_refcnt;
        PyTypeObject* ob_type;
}

struct PyVarObject {
	PyObject ob_base;
	int ob_size; 
}

alias int function() setattrfunc;

struct PyTypeObject {
    PyVarObject ob_base;
    const(char)* tp_name;
    int tp_basicsize, tp_itemsize;

    setattrfunc tp_dealloc;
    setattrfunc tp_print;
    setattrfunc tp_getattr;
    setattrfunc tp_setattr;
    void* tp_as_async;
    setattrfunc tp_repr;

    void* tp_as_number;
    void* tp_as_sequence;
    void* tp_as_mapping;

    setattrfunc tp_hash;
    setattrfunc tp_call;
    setattrfunc tp_str;
    setattrfunc tp_getattro;
    setattrfunc tp_setattro;

    void* tp_as_buffer;
    long tp_flags;

}

void main() 
{
	writefln("tp_as_buffer offset: %s", PyTypeObject.tp_as_buffer.offsetof);
	writefln("tp_as_buffer size: %s", PyTypeObject.tp_as_buffer.sizeof);
	writefln("tp_flags offset: %s", PyTypeObject.tp_flags.offsetof);
}
