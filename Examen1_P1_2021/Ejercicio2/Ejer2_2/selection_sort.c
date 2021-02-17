#include <easm_crt.h>

static int *min_element(int *beg, int *end)
{
    int *min = beg++;

    while (beg != end)
    {
        if (*beg < *min)
            min = beg;

        beg++;
    }

    return min;
}

void selectionSort(int numbers[], int size)
{
    int *beg = numbers;
    int *end = numbers + size;

    while (beg != end)
    {
        int *it = min_element(beg, end);

        if (it != beg)
        {
            int temp = *beg;
            *beg = *it;
            *it = temp;
        }
        beg++;
    }
}