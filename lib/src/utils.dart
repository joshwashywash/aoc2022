Map<S, T> reverseMap<T, S>(Map<T, S> map) =>
    {for (final e in map.entries) e.value: e.key};
