import random

def generate_vector():
    a = random.randint(1, 4)
    b = random.randint(1, 6)
    c = random.randint(1, 6)
    d = random.randint(1, 8)
    e = random.randint(1, 6)
    f = random.randint(1, 26)
    g = random.randint(1, 2)
    return [a, b, c, d, e, f, g]

vectors = [generate_vector() for _ in range(20)]

for vector in vectors:
    print(vector)