/**
  Mirror _object.h

Object and type object interface

Objects are structures allocated on the heap.  Special rules apply to
the use of objects to ensure they are properly garbage-collected.
Objects are never allocated statically or on the stack; they must be
accessed through special macros and functions only.  (Type objects are
exceptions to the first rule; the standard types are represented by
statically initialized type objects, although work on type/class unification
for Python 2.2 made it possible to have heap-allocated type objects too).

An object has a 'reference count' that is increased or decreased when a
pointer to the object is copied or deleted; when the reference count
reaches zero there are no references to the object left and it can be
removed from the heap.

An object has a 'type' that determines what it represents and what kind
of data it contains.  An object's type is fixed when it is created.
Types themselves are represented as objects; an object contains a
pointer to the corresponding type object.  The type itself has a type
pointer pointing to the object representing the type 'type', which
contains a pointer to itself!).

Objects do not float around in memory; once allocated an object keeps
the same size and address.  Objects that must hold variable-size data
can contain pointers to variable-size parts of the object.  Not all
objects of the same type have the same size; but the size cannot change
after allocation.  (These restrictions are made so a reference to an
object can be simply a pointer -- moving an object would require
updating all the pointers, and changing an object's size would require
moving it if there was another object right next to it.)

Objects are always accessed through pointers of the type 'PyObject *'.
The type 'PyObject' is a structure that only contains the reference count
and the type pointer.  The actual memory allocated for an object
contains other data that can only be accessed after casting the pointer
to a pointer to a longer structure type.  This longer type must start
with the reference count and type fields; the macro PyObject_HEAD should be
used for this (to accommodate for future changes).  The implementation
of a particular object type can cast the object pointer to the proper
type and back.

A standard interface exists for objects that contain an array of items
whose size is determined when the object is allocated.
  */
module deimos.python.object;

import deimos.python.pyport;
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

