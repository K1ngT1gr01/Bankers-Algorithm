all:
	gcc -Wall -std=c99 -pedantic BankersAlgo.c -o BankerAlgo
	./BankerAlgo
clean:
	rm BankerAlgo
