# Metacall-vm-image

Linux image for running metacall with Qemu.

## How to Generate the Distributable Tarballs

This will generate all tarballs in the `out` directory. All logs will be stored in `dist.log`. This process will test if tarballs are correct too.

```bash
make &> dist.log & tail -f dist.log
```

