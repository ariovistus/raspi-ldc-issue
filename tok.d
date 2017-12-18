import std.stdio;

alias long C_long;
alias int Py_ssize_t;

struct PyObject {
        Py_ssize_t ob_refcnt;
        PyTypeObject* ob_type;
}

/// _
struct PyVarObject {
	PyObject ob_base;
	Py_ssize_t ob_size; 
}

/// _
alias int function() setattrfunc;
/// _
struct PyTypeObject {
    PyVarObject ob_base;
    const(char)* tp_name;
    Py_ssize_t tp_basicsize, tp_itemsize;

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
    C_long tp_flags;

}

void main() 
{
	writeln("tacos");
	// DustMiteNoRemoveStart
	assert(PyTypeObject.tp_as_buffer.offsetof == 80);
	assert(PyTypeObject.tp_as_buffer.sizeof == 4);
	assert(PyTypeObject.tp_flags.offsetof == 88);
	// DustMiteNoRemoveStop
}
