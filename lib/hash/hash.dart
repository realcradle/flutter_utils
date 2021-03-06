library hash;

/// Created by @RealCradle on 2021/7/7

/// Generates a hash code for multiple [objects].
int hashObjects(Iterable objects) => _finish(objects.fold(0, (h, i) => _combine(h, i.hashCode)));

/// Generates a hash code for two objects.
int hash2(a, b) => _finish(_combine(_combine(0, a.hashCode), b.hashCode));

/// Generates a hash code for three objects.
int hash3(a, b, c) => _finish(_combine(_combine(_combine(0, a.hashCode), b.hashCode), c.hashCode));

/// Generates a hash code for four objects.
int hash4(a, b, c, d) => _finish(
    _combine(_combine(_combine(_combine(0, a.hashCode), b.hashCode), c.hashCode), d.hashCode));

int hashIntList(List<int> list) => _finish(list.fold(0x9E370001, (h, i) => _combine(h, i)));

// Jenkins hash functions

int _combine(int hash, int value) {
  hash = 0x1fffffff & (hash + value);
  hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
  return hash ^ (hash >> 6);
}

int _finish(int hash) {
  hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
  hash = hash ^ (hash >> 11);
  return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
}

int hashCombine(int hash, int value) {
  return _combine(hash, value);
}

int hashFinish(int hash) {
  return _finish(hash);
}
