import 'package:flutter/material.dart';
import 'package:gamedex/widgets/star_rating.dart';

import '../models/review.dart';
import '../models/user.dart';
import '../services/review_service.dart';
import '../services/user_service.dart';

class ReviewList extends StatelessWidget {
  final String gameId;
  const ReviewList({required this.gameId, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: UserService().fetchUsers(), // fetch users only once
      builder: (context, userSnapshot) {
        if (!userSnapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final users = userSnapshot.data!;

        return StreamBuilder<List<Review>>(
          stream: ReviewService().listenToReviewsByGameId(gameId),
          builder: (context, reviewSnapshot) {
            if (!reviewSnapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            final reviews = reviewSnapshot.data!;
            if (reviews.isEmpty) {
              return Center(
                child: Text('Nenhuma review ainda, seja o primeiro!'),
              );
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                final user = users.firstWhere(
                  (u) => u.id == review.userId,
                  orElse: () => User(username: "Desconhecido", avatarUrl: ""),
                );

                return ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  leading: CircleAvatar(
                    backgroundImage:
                        (user.avatarUrl != null && user.avatarUrl!.isNotEmpty)
                            ? NetworkImage(user.avatarUrl!)
                            : null,
                    child:
                        (user.avatarUrl == null || user.avatarUrl!.isEmpty)
                            ? Text(
                              (user.username != null &&
                                      user.username!.isNotEmpty)
                                  ? user.username![0]
                                  : "?",
                            )
                            : null,
                  ),

                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        user.username!,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      StarRating(
                        readOnly: true,
                        rating: review.rating,
                        onRatingChanged: (_) {},
                        starSize: 15,
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (review.createdAt != null)
                        Text(
                          "${review.createdAt!.day}/${review.createdAt!.month}/${review.createdAt!.year}",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                        ),
                      SizedBox(height: 4),
                      Text(
                        review.text ?? "",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
