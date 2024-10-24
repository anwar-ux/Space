import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/chat/full_link_controller.dart';
import 'package:flutter_application_2/utils/colors.dart';
import 'package:get/get.dart';

class FullLink extends StatelessWidget {
  final bool isMe;
  final String url;

  FullLink({super.key, required this.isMe, required this.url}) {
    // Controller is initialized here so that fetch happens only once
    Get.put(FullLinkController(), tag: url).fetchLinkPreview(url);
  }

  @override
  Widget build(BuildContext context) {
    // Use Get.find with tag to retrieve the correct controller
    final FullLinkController controller = Get.find<FullLinkController>(tag: url);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7, // 70% of the screen width
          ),
          child: Container(
            decoration: BoxDecoration(
              color: isMe ? AppColor.chatSend : AppColor.chatRecive,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display the image if available, otherwise a placeholder
                Obx(() => controller.isLoading.value
                    ? Container(
                        height: 120,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      )
                    : controller.imageUrl.isNotEmpty && controller.imageUrl.value.startsWith('http')
                        ? Container(
                            height: 120,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(controller.imageUrl.value),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(18),
                                topRight: Radius.circular(18),
                              ),
                            ),
                          )
                        : Container(
                            height: 120,
                            decoration: BoxDecoration(
                              color: AppColor.seconderyColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(18),
                                topRight: Radius.circular(18),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: const Icon(Icons.link),
                          )),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isMe ? AppColor.chatSend : AppColor.chatRecive,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title of the link preview
                          Text(
                            controller.title.value.isNotEmpty
                                ? controller.title.value
                                : "Unknown Title",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          // Description of the link preview
                          Text(
                            controller.description.value.isNotEmpty
                                ? controller.description.value
                                : "No description available",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                           Text(
                           url,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
