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
    return FutureBuilder<List<Review>>(
      future: ReviewService().fetchReviewsByGameId(gameId),
      builder: (context, reviewSnapshot) {
        if (reviewSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (reviewSnapshot.hasError) {
          return Center(child: Text('Erro ao carregar reviews ${reviewSnapshot.error}'));
        } else if (!reviewSnapshot.hasData || reviewSnapshot.data!.isEmpty) {
          return Center(child: Text('Nenhuma review ainda, seja o primeiro!'));
        }

        final reviews = reviewSnapshot.data!;

        return FutureBuilder<List<User>>(
          future: UserService().fetchUsers(),
          builder: (context, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (userSnapshot.hasError) {
              return Center(child: Text('Erro ao carregar usuários'));
            } else if (!userSnapshot.hasData || userSnapshot.data!.isEmpty) {
              return Center(child: Text('Nenhum usuário encontrado'));
            }

            final users = userSnapshot.data!;

            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                final user = users.firstWhere(
                      (u) => u.id == review.userId,
                  orElse: () => User(username: "Desconhecido"),
                );

                return ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  leading: CircleAvatar(
                    child: Text(user.username != null && user.username!.isNotEmpty
                        ? user.username![0]
                        : "?"),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(user.username ?? "Desconhecido", style:Theme.of(context).textTheme.titleSmall),
                      StarRating(readOnly: true, rating: review.rating,onRatingChanged: (rating) {}, starSize: 15,)
                    ],
                  ),
                  subtitle: Text(review.text ?? "", style:Theme.of(context).textTheme.bodySmall),
                );
              },
            );
          },
        );
      },
    );
  }
}
