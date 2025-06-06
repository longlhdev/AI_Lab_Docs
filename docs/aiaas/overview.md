# AIaaS Overview

## Introduction

**AIaaS (AI as a Service)** is the foundation of Apero’s AI Lab ecosystem — a suite of high-performance, production-ready AI APIs designed to power modern mobile and web applications at scale.

From creative tools like *Text-to-Image*, *Outpainting*, and *Logo Generation*, to technical services like *Segmentation*, *Restoration*, and *Palm Scanning*, AIaaS enables developers and product teams to integrate AI features into their applications effortlessly.

All services are delivered with high security, performance, and multi-version support — ensuring flexibility and stability for both internal and third-party use cases.

---

## Key Features

- **Secure by Default**  
  All APIs require HMAC-based API Signature for every request, ensuring integrity and access control.

- **High Performance**  
  Scalable GPU-powered backend for real-time or near real-time AI inference.

- **Multi-Version Support**  
  Each service can evolve independently, with backward-compatible versions.

- **Unified Developer Experience**  
  Consistent request and response formats across all APIs. Swagger/OpenAPI available for all endpoints.

- **Usage Insights & Monitoring**  
  Optional logging hooks and real-time analytics available for enterprise partners.

---

## Available AI Services

Here’s a list of currently available services under AIaaS:

| Category           | Service Names                                                                 |
|--------------------|-------------------------------------------------------------------------------|
| 🎨 Creative         | Art, Art Premium, Text to Image, Outpainting, Inpainting, Logo Generator     |
| 🧖 Beauty & Photos  | Beauty, Enhance, Restore, Remove Object, Clothes Changing, Image Combine, Makeup     |
| 🛋️ Decor & Lifestyle | Home Decorator, Fitting, Clothes                                             |
| 🧬 Recognition      | Palm Scanning, Segment, Plant Identifier                                      |
| 🎥 Video            | AI Video (Beta)                                                               |

> You can explore detailed API documentation for each service from the navigation menu.

---

## Who Should Use AIaaS?

- Product teams seeking **fast AI integration** without the burden of infrastructure.
- Mobile apps and games needing **real-time AI features** like avatar styling, enhancement, or object removal.
- SaaS platforms looking to **enhance user-generated content** with generative AI.
- Internal Apero products requiring **modular and maintainable AI components**.

---

## Authentication & Access

All AIaaS endpoints require:

1. A valid `x-api-key` assigned by Apero.
2. HMAC-based signature (`x-api-signature`) generated using the shared secret.
3. Timestamps to prevent replay attacks using `x-timestamp`.

See the [Security & API Signature Guide](./security/api-signature.md) for integration examples.

---

## API Versioning

Each AIaaS product may have multiple versions (e.g. `v1`, `v2`, ...). You can:

- Use the latest version by default.
- Explicitly specify a version in the API path: `/api/v4/art-premium`

Deprecation notices and changelogs will be published per service.

---

## Support & Contact

If you're an internal team at Apero or a strategic partner:

- Contact: `ai-lab@apero.vn`
- Want custom model integration? Ask about our **Enterprise Tier**

---

> Next: Choose a service in the left sidebar to begin integrating AI features in minutes.
