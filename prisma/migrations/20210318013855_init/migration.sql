-- CreateTable
CREATE TABLE `profiles` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `image` VARCHAR(191),
    `bio` VARCHAR(191),
    `role` VARCHAR(191),
    `meta_student_school` VARCHAR(191),
    `meta_student_years` VARCHAR(191),
    `meta_hobbyist_years` VARCHAR(191),
    `meta_machinist_shop` VARCHAR(191),
    `meta_machinist_shop_size` VARCHAR(191),
    `meta_teacher_school` VARCHAR(191),
    `meta_teacher_students` VARCHAR(191),
    `role_other` VARCHAR(191),
    `cad_app` VARCHAR(191),
    `user_id` INTEGER NOT NULL,
UNIQUE INDEX `profiles.user_id_unique`(`user_id`),
INDEX `profiles.user_id_index`(`user_id`),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sidedata` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `academy` JSON,
    `aerospace` JSON,
    `cncexpert` JSON,
    `user_id` INTEGER NOT NULL,
UNIQUE INDEX `sidedata.user_id_unique`(`user_id`),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(191),
    `last_name` VARCHAR(191),
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `is_admin` BOOLEAN NOT NULL DEFAULT false,
    `email_updates` BOOLEAN DEFAULT false,
    `email_verified` DATETIME(3),
    `last_login` DATETIME(3),
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
UNIQUE INDEX `users.email_unique`(`email`),
INDEX `users.email_index`(`email`),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `verification_requests` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(191) NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `token` VARCHAR(191) NOT NULL,
    `expires` DATETIME(3) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
UNIQUE INDEX `verification_requests.token_unique`(`token`),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `profiles` ADD FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sidedata` ADD FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
