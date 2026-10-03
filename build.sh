set -e
nasm -f elf32 boot.asm -o boot.o
gcc -m32 -ffreestanding -fno-pie -fno-stack-protector -O2 -Wall -c kernel.c -o kernel.o
ld -m elf_i386 -T linker.ld -o myos.bin boot.o kernel.o
mkdir -p iso/boot/grub
cp myos.bin iso/boot/myos.bin
cp grub.cfg iso/boot/grub/grub.cfg
grub-mkrescue -o myos.iso iso
echo "Build OK: myos.iso ban gayi"
