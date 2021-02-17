static void swap(int *n1, int *n2)
{
    int temp = *n1;
    *n1 = *n2;
    *n2 = temp;
}

void insertionSort(int numbers[], int size)
{
    for (int i = 1; i < size; i++)
    {
        int j = i;
        while (j > 0 && numbers[j - 1] > numbers[j])
        {
            swap(&numbers[j - 1], &numbers[j]);
            j--;
        }
    }

} 
