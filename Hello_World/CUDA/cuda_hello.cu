#include <stdio.h>

__global__ void cuda_hello(){
    printf("Hello World from GPU!\n");
}

__global__ void print_kernel() {
    printf("Hello from block %d, thread %d\n", blockIdx.x, threadIdx.x);
}

int main() {
    cuda_hello<<<1,1>>>(); 
    cudaDeviceSynchronize();

    print_kernel<<<10, 10>>>();
    cudaDeviceSynchronize();
    return 0;
}
