module pyport;

/// _
    alias long C_long;
        /// _
        alias int Py_ssize_t;
        /// Availability: >= 3.2
        /// (Py_hash_t invariably replaces C_long, so we always define it for
        /// convenience)
        alias Py_ssize_t Py_hash_t;
