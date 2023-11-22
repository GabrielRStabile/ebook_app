import 'package:collection/collection.dart';
import 'package:ebook_app/domain/entities/book_entity.dart';
import 'package:ebook_app/presentation/app_theme.dart';
import 'package:ebook_app/presentation/controllers/epub_controller/epub_controller.dart';
import 'package:ebook_app/presentation/controllers/favorite_controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:widget_mask/widget_mask.dart';

class BookWidget extends StatefulWidget {
  final BookEntity book;

  const BookWidget({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  final epubController = Modular.get<EpubController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () => epubController.openBook(widget.book),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(1, 4),
                    ),
                  ],
                ),
                child: WidgetMask(
                  blendMode: BlendMode.overlay,
                  childSaveLayer: true,
                  mask: Image.network(widget.book.coverUrl),
                  child: Image.asset('assets/book_mask.png'),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.book.title,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Flexible(
              child: Text(
                widget.book.author,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Positioned(
          right: 0,
          top: -10,
          child: _BookmarkIcon(book: widget.book),
        ),
      ],
    );
  }
}

class _BookmarkIcon extends StatefulWidget {
  final BookEntity book;

  const _BookmarkIcon({required this.book});

  @override
  State<_BookmarkIcon> createState() => __BookmarkIconState();
}

class __BookmarkIconState extends State<_BookmarkIcon> {
  final favoriteController = Modular.get<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => favoriteController.toggleFavorite(widget.book),
      child: ValueListenableBuilder(
        valueListenable: favoriteController.books,
        builder: (_, book, __) {
          bool isFavorited = book
                  .firstWhereOrNull((e) => e.id == widget.book.id)
                  ?.isFavorited ??
              false;

          return Icon(
            isFavorited ? Icons.bookmark : Icons.bookmark_border,
            color: isFavorited
                ? Colors.redAccent
                : Theme.of(context).extension<AppTheme>()?.primaryColor,
            shadows: isFavorited
                ? [
                    Shadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(1, 1),
                    )
                  ]
                : null,
            size: 50,
          );
        },
      ),
    );
  }
}
