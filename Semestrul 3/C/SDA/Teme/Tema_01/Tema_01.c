#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif
#include <stdio.h>

unsigned int exercitiu_1(void) {
	unsigned baza, exponent;

	printf("Introduceti baza : ");
	scanf("%u", &baza);

	printf("Introduceti exponentul : ");
	scanf("%u", &exponent);

	int i = 0;
	unsigned output = 1;

	while (i < exponent) {
		output = output * baza;

		i++;
	}

	return output;
}

int exercitiu_2(void) {
	unsigned an;

	printf("Introduceti anul pe care doriti sa il verificati : ");
	scanf("%u", &an);

	if (an % 400 == 0) {
		return 1;
	}

	if (an % 100 == 0) {
		return 0;
	}

	if (an % 4 == 0) {
		return 1;
	}

	return 0;
}

int main(void) {
	int optiune = 0;

	printf("Introduceti 1 pentru exercitiul 1 si 2 pentru exercitiul 2 : ");
	scanf("%d", &optiune);
	unsigned output;

	switch (optiune) {
	case 1:
		output= exercitiu_1();
		printf("Rezultatul este : %u", output);
		break;
	case 2:
		output = exercitiu_2();
		if (output) {
			printf("Anul este bisect \n");
		}
		else {
			printf("Anul nu este bisect \n");
		}
		break;

	default:
		printf("Optiune invalida \n");
		break;
	}

	return 0;
}