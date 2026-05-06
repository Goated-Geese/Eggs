# Custom Pelican yolk — .NET 10 on Ubuntu 24 (Noble)

**Maintainers:** Goated Geese (GG-AU) · [hello@gg-au.com](mailto:hello@gg-au.com) · [github.com/Goated-Geese/Eggs](https://github.com/Goated-Geese/Eggs)

Use this image when the game’s native `.so` files need **glibc ≥ 2.38** (e.g. Facepunch `libengine2.so` on s&box). Pelican’s `ghcr.io/pelican-eggs/yolks:dotnet_10` is Debian Bookworm (~glibc 2.36) and will fail `ldd` for those binaries.

This yolk follows Pelican’s requirements:

- User **`container`** with home **`/home/container`**
- **`WORKDIR /home/container`**
- **`tini`** + **`entrypoint.sh`** that expands `STARTUP` placeholders like the upstream guide

References:

- [Creating a Custom Yolk](https://pelican.dev/docs/eggs/creating-a-custom-yolk)
- [Creating a Custom Egg](https://pelican.dev/docs/eggs/creating-a-custom-egg)

## Published image (Goated Geese)

After pushes to `main` that touch `sbox/yolk-dotnet10-noble/`, GitHub Actions publishes:

**`ghcr.io/goated-geese/sbox-dotnet10-noble:latest`**

Pull from Wings nodes with registry access. If the package is private, set the node Docker config / Pelican registry credentials per your host docs.

## Build locally

From this directory:

```bash
docker build -t ghcr.io/goated-geese/sbox-dotnet10-noble:latest .
```

Multi-arch example (optional — CI currently builds `linux/amd64` only):

```bash
docker buildx build --platform linux/amd64,linux/arm64 \
  -t ghcr.io/goated-geese/sbox-dotnet10-noble:latest --push .
```

## Use with the s&box egg

1. Push the image to a registry your Wings nodes can pull.
2. In the Pelican nest (or egg) **Docker Images** list, add a row: friendly name + your image URI.
3. Select that image for the server. Keep the egg’s existing **Startup** command.

Optional: **`mcr.microsoft.com/dotnet/runtime:10.0-noble`** omits Pelican’s `container` user + `entrypoint.sh` wiring; use this Dockerfile when you want behavior aligned with the official Pelican yolk docs.
