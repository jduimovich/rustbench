
public class Fib {
    int fibonacci(int x) {
	if (x < 3)
	    return 1;
	return fibonacci(x - 1) + fibonacci(x - 2);
    }
    void run(int iterations, int fib) {
	long start, end;
	start = System.currentTimeMillis();
	for (int i = 0; i < iterations; i++)
	    fibonacci(fib);
	end = System.currentTimeMillis();
	System.out.println("Fibonacci " + fib + " " + iterations + " = " + (end - start));

    }

    public static void main(String[] args) {
	System.out.println(System.getProperty("java.vm.name") + " " + System.getProperty("java.vm.version") + " "
			   + System.getProperty("java.runtime.version"));

	int count = 5;
	while (count-- > 0) {	new Fib().run (200000, 12); }
    }
}
