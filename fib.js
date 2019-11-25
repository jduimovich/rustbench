if (currenttime === undefined) {
    var currenttime = function() {return new Date().getTime(); }
}
function fib(n) {
    if (n < 3) return 1;
    return fib(n - 1) + fib(n - 2);
}
function bench(count) {
    var start = currenttime();
    for (var i = 0; i < count; i++) {
        fib(12);
    }
    var end = currenttime();
    return end - start;
}
var loop = 200000;
var c=4;
while (c-- > 0) console.log(' Standard Fib  ', loop, ' iterations  = ', bench(loop), " ms");
