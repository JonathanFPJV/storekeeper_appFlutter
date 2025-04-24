import 'package:flutter/material.dart';
import 'product_detail_page.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Productos de ejemplo
    final productos = [
      {
        'nombre': 'Camiseta',
        'categoria': 'Ropa',
        'cantidad': 25,
        'precio': 19.99,
      },
      {
        'nombre': 'Pantalón',
        'categoria': 'Ropa',
        'cantidad': 15,
        'precio': 39.99,
      },
      {
        'nombre': 'Zapatos',
        'categoria': 'Calzado',
        'cantidad': 10,
        'precio': 59.99,
      },
      {
        'nombre': 'Gorra',
        'categoria': 'Accesorios',
        'cantidad': 30,
        'precio': 14.99,
      },
      {
        'nombre': 'Chaqueta',
        'categoria': 'Ropa',
        'cantidad': 8,
        'precio': 79.99,
      },
    ];

    return Stack(
      children: [
        // Imagen de fondo con overlay para mejor legibilidad
        Positioned.fill(
          child: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.3),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ).createShader(bounds),
            blendMode: BlendMode.darken,
            child: Image.asset('assets/images/fondo.png', fit: BoxFit.cover),
          ),
        ),

        // Contenido principal
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado con título y botón de búsqueda
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Inventario',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${productos.length} productos en stock',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                    // Botón de búsqueda
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.search, color: Colors.white),
                        onPressed: () {
                          // Implementar búsqueda
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Barra de filtros para categorías
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterChip(context, 'Todos', true),
                      const SizedBox(width: 8),
                      _buildFilterChip(context, 'Ropa', false),
                      const SizedBox(width: 8),
                      _buildFilterChip(context, 'Calzado', false),
                      const SizedBox(width: 8),
                      _buildFilterChip(context, 'Accesorios', false),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Lista de productos
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  itemCount: productos.length,
                  itemBuilder: (context, index) {
                    final producto = productos[index];
                    return _buildProductCard(context, producto);
                  },
                ),
              ),

              // Botón flotante para agregar producto
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      // Implementar agregar producto
                    },
                    backgroundColor: theme.colorScheme.primary,
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget para filtros de categoría
  Widget _buildFilterChip(BuildContext context, String label, bool isSelected) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        // Implementar selección de filtro
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primary
              : Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // Widget para tarjeta de producto
  Widget _buildProductCard(BuildContext context, Map<String, dynamic> producto) {
    final theme = Theme.of(context);
    return Card(
      color: Colors.black.withOpacity(0.5),
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(
                nombreProducto: producto['nombre'],
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Imagen del producto (placeholder)
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    _getIconForCategory(producto['categoria']),
                    color: theme.colorScheme.primary,
                    size: 36,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Detalles del producto
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      producto['nombre'],
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      producto['categoria'],
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _buildInfoBadge(
                          context,
                          'Stock: ${producto['cantidad']}',
                          Icons.inventory,
                        ),
                        const SizedBox(width: 8),
                        _buildInfoBadge(
                          context,
                          '\$${producto['precio']}',
                          Icons.attach_money,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Icono para navegar al detalle
              const Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para las insignias de información
  Widget _buildInfoBadge(BuildContext context, String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 12,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  // Obtener icono según la categoría
  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Ropa':
        return Icons.checkroom;
      case 'Calzado':
        return Icons.icecream;  // No hay ícono de zapatos, así que usamos uno similar
      case 'Accesorios':
        return Icons.watch;
      default:
        return Icons.inventory;
    }
  }
}