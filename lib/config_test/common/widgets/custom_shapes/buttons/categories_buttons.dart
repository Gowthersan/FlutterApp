import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombien_test/config_test/features/annonces/models/categories.dart';
import 'package:mombien_test/config_test/features/annonces/screens/home/categories_page.dart';
import 'package:mombien_test/config_test/utils/constants/sizes.dart';

class TCategoriesButton extends StatelessWidget {
  final TCategoriesModel categoryModel;

  const TCategoriesButton({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        () => TCategoriesPage(categoryModel: categoryModel),
        transition: Transition.rightToLeft,
      ),
      child: TContainerForm(categoryModel: categoryModel),
    );
  }
}

class TContainerForm extends StatelessWidget {
  const TContainerForm({
    super.key,
    required this.categoryModel,
  });

  final TCategoriesModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(TSizes.sm),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            categoryModel.title,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          Flexible(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(),
              child: Icon(
                categoryModel.icon,
                size: TSizes.iconMd,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
