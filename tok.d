import std.stdio;

alias long C_long;
alias int Py_ssize_t;
alias Py_ssize_t Py_hash_t;

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
alias PyObject* ternaryfunc;
struct PyNumberMethods {
}

/// _
struct PySequenceMethods {
}

/// _
struct PyMappingMethods {
}

    /// _
    struct PyAsyncMethods {
    }
/// _
struct PyBufferProcs {
}


/// _
alias void function() destructor;
/// _
alias int function() printfunc;
/// _
alias PyObject* getattrfunc;
/// _
alias PyObject* getattrofunc;
/// _
alias int function() setattrfunc;
/// _
alias int function() setattrofunc;
/// _
alias PyObject* reprfunc;
/// _
alias Py_hash_t function() hashfunc;
struct PyTypeObject {
            PyVarObject ob_base;
    const(char)* tp_name;
    Py_ssize_t tp_basicsize, tp_itemsize;

    destructor tp_dealloc;
    printfunc tp_print;
    getattrfunc tp_getattr;
    setattrfunc tp_setattr;
        PyAsyncMethods* tp_as_async;
    reprfunc tp_repr;

    PyNumberMethods* tp_as_number;
    PySequenceMethods* tp_as_sequence;
    PyMappingMethods* tp_as_mapping;

    hashfunc tp_hash;
    ternaryfunc tp_call;
    reprfunc tp_str;
    getattrofunc tp_getattro;
    setattrofunc tp_setattro;

    PyBufferProcs* tp_as_buffer;
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
