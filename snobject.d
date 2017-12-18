module snobject;

import pyport;
/** Nothing is actually declared to be a PyObject, but every pointer to
 * a Python object can be cast to a PyObject*.  This is inheritance built
 * by hand.  Similarly every pointer to a variable-size Python object can,
 * in addition, be cast to PyVarObject*.
 */
struct PyObject {
        Py_ssize_t ob_refcnt;
        PyTypeObject* ob_type;
}

/// _
struct PyVarObject {
            PyObject ob_base;
        Py_ssize_t ob_size; }

/// _
alias PyObject* ternaryfunc;
/** For numbers without flag bit Py_TPFLAGS_CHECKTYPES set, all
   arguments are guaranteed to be of the object's type (modulo
   coercion hacks -- i.e. if the type's coercion function
   returns other types, then these are allowed as well).  Numbers that
   have the Py_TPFLAGS_CHECKTYPES flag bit set should check *both*
   arguments for proper type and implement the necessary conversions
   in the slot functions themselves. */
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
    /** For printing, in format "<module>.<name>" */
    const(char)tp_name;
    /** For allocation */
    Py_ssize_t tp_basicsize, tp_itemsize;

    /** Methods to implement standard operations */
    destructor tp_dealloc;
    /// ditto
    printfunc tp_print;
    /// ditto
    getattrfunc tp_getattr;
    /// ditto
    setattrfunc tp_setattr;
        PyAsyncMethods* tp_as_async;
    /// ditto
    reprfunc tp_repr;

    /** Method suites for standard classes */
    PyNumberMethods* tp_as_number;
    /// ditto
    PySequenceMethods* tp_as_sequence;
    /// ditto
    PyMappingMethods* tp_as_mapping;

    /** More standard operations (here for binary compatibility) */
    hashfunc tp_hash;
    /// ditto
    ternaryfunc tp_call;
    /// ditto
    reprfunc tp_str;
    /// ditto
    getattrofunc tp_getattro;
    /// ditto
    setattrofunc tp_setattro;

    /** Functions to access object as input/output buffer */
    PyBufferProcs* tp_as_buffer;

    /** Flags to define presence of optional/expanded features */
    C_long tp_flags;

}

