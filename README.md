# hr-tribe-bienvenida

Página de bienvenida para los asistentes del **3er HR Tribe Summit 2026 — HUMAN FIRST**
(26 de agosto de 2026 · Club Casino Monterrey).

**En vivo:** https://hectorleon-hue.github.io/hr-tribe-bienvenida/

## Qué contiene

Un solo archivo, `index.html`, sin dependencias externas (los PDFs y las imágenes van
embebidos en base64). Se puede abrir localmente o servir desde GitHub Pages.

| Sección | Qué hace |
|---|---|
| Bienvenida | Leyenda de bienvenida + descarga de la agenda en PDF |
| Elige tu taller | Los 6 talleres simultáneos, ordenables del 1 al 6. Guarda en Supabase |
| Clima | Pronóstico del 26 de agosto con curva de temperatura por hora |
| Estacionamiento | Dirección, ligas a Maps/Waze y recomendaciones de traslado |
| Dress code | Business Casual recomendado |
| Logística | Descarga de la guía de logística en PDF |

## Elección de talleres

Cada envío se inserta en la tabla `summit_talleres` del proyecto Supabase **ADN-Lamosa**.
La asignación se hace **por orden de llegada**: la columna `creado_en` es la que manda.

Si Supabase no responde, la página cae a un respaldo que abre WhatsApp o correo con la
elección ya prellenada — ningún asistente se queda sin poder contestar.

### Configuración

Al inicio del `<script>` en `index.html`:

```js
const CONFIG = {
  SUPABASE_URL: "https://istfqqmuxcuhduakrojo.supabase.co",
  SUPABASE_ANON_KEY: "...",          // anon / publishable key
  SUPABASE_TABLE: "summit_talleres",
  WHATSAPP: "528114961307",
  EMAIL: "hola@hrtribe.org"
};
```

El esquema de la tabla y las políticas de RLS están en [`supabase.sql`](supabase.sql).
`anon` solo puede **insertar**; leer requiere sesión autenticada, así que los correos de
los asistentes no quedan expuestos.

### Ver las respuestas

Supabase → ADN-Lamosa → Table Editor → `summit_talleres`, ordenado por `creado_en`.
Columnas `p1`…`p6` traen los talleres en orden de prioridad, listas para exportar a CSV.

---

HR TRIBE A.C. · Convivir · Aprender · Trascender
Powered by [Grow2GetherMx](https://grow2gethermx.com)
