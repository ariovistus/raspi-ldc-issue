#include <stdio.h>

typedef int (*setattrfunc)();

struct PyObject {
        int ob_refcnt;
        struct PyTypeObject* ob_type;
};

struct PyVarObject {
	struct PyObject ob_base;
	int ob_size; 
};

struct PyTypeObject {
    struct PyVarObject ob_base;
    const char *tp_name;
    int tp_basicsize, tp_itemsize;

    setattrfunc tp_dealloc;
    setattrfunc tp_print;
    setattrfunc tp_getattr;
    setattrfunc tp_setattr;
    void *tp_as_async;
    setattrfunc tp_repr;

    void *tp_as_number;
    void *tp_as_sequence;
    void *tp_as_mapping;

    setattrfunc tp_hash;
    setattrfunc tp_call;
    setattrfunc tp_str;
    setattrfunc tp_getattro;
    setattrfunc tp_setattro;

    void *tp_as_buffer;
    long tp_flags;
};

int main() {
	struct PyTypeObject p;
	printf("tp_as_buffer offset: %d\n", ((long) &p.tp_as_buffer) - (long)&p);
	printf("tp_as_buffer size: %d\n", sizeof(p.tp_as_buffer));
	printf("tp_flags offset: %d\n", ((long) &p.tp_flags) - (long)&p);
}
