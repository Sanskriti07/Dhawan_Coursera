/******************************************************************************
 * Copyright (C) 2021 by Sanskriti Dhawan - University of Colorado
 *
 * Redistribution, modification or use of this software in source or binary
 * forms is permitted as long as the files maintain this copyright. Users are
 * permitted to modify this and use it to learn about the field of embedded
 * software. Sanskriti Dhawan and the University of Colorado are not liable for any
 * misuse of this material.
 *
 *****************************************************************************/
/**
 * @file stats.c
 * @brief a simple application (c) that performs statistical analytics on a dataset
 *
 *functions that can analyze an array of unsigned char data items and report
 *analytics on the maximum, minimum, mean, and median of the data set. In
 *addition, to reorder this data set from large to small. All
 *statistics should be rounded down to the nearest integer. After analysis sorting
 *is done.
 *
 * @author Sanskriti Dhawan
 * @date 31-06-21
 *
 */
#include <stdio.h>
/* Size of the Data Set */
#define SIZE (40)
void print_statistics(unsigned char array[],unsigned int length);
void print_array(unsigned char array[],unsigned int length);
unsigned char find_median(unsigned char array[],unsigned int length);
unsigned char find_max(unsigned char array[],unsigned int length);
unsigned char find_min(unsigned char array[]);
unsigned char find_mean(unsigned char array[], unsigned int length);
void sort_array(unsigned char array[],unsigned int length);
void main() {
  unsigned char test[SIZE] = { 34, 201, 190, 154,   8, 194,   2,   6,
     114, 88,   45,  76, 123,  87,  25,  23,
     200, 122, 150, 90,   92,  87, 177, 244,
     201,   6,  12,  60,   8,   2,   5,  67,
7,  87, 250, 230,  99,   3, 100,  90};

  /* Other Variable Declarations Go Here */
  /* Statistics and Printing Functions Go Here */
  print_statistics(test, SIZE);

}

/* Add other Implementation File Code Here */
void print_statistics(unsigned char array[], unsigned int length)
{
/*display original array
  sort the array
  display sorted array
*/

}

void print_array(unsigned char array[], unsigned int length){
/*print the array*/

}

unsigned char find_median(unsigned char array[], unsigned int length)
{
/*return array median*/
}
unsigned char find_mean(unsigned char array[], unsigned int length)
{
/*return mean*/
}

unsigned char find_max(unsigned char array[],unsigned int length)
{
/*return max */
}

unsigned char find_min(unsigned char array[])
{
/*return array[0]*/
}

void sort_array(unsigned char array[], unsigned int length)
{
/*sort from min to max*/
}

	

