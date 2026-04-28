import os

def create_file(path, content=""):
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)


def create_feature(base_path: str, feature_name: str):
    feature = feature_name.lower()

    folders = [
        f"{feature}/data/datasources",
        f"{feature}/data/models",
        f"{feature}/data/repositories",
        f"{feature}/domain/entities",
        f"{feature}/domain/repositories",
        f"{feature}/domain/use_cases",
        f"{feature}/presentation/components",
        f"{feature}/presentation/view",
        f"{feature}/presentation/widgets",
        f"{feature}/presentation/controller",  # ✅ added
    ]

    feature_path = os.path.join(base_path, feature)

    if os.path.exists(feature_path):
        print(f"❌ Feature '{feature}' already exists at: {feature_path}")
        return

    print(f"\n🚀 Creating feature: {feature}")
    print(f"📁 Location: {os.path.abspath(feature_path)}\n")

    # Create folders (❌ removed .gitkeep)
    for folder in folders:
        full_path = os.path.join(base_path, folder)
        os.makedirs(full_path, exist_ok=True)
        print(f"  ✅ Created: {folder}")

    class_name = feature.capitalize()

    # Entity
    create_file(
        os.path.join(base_path, f"{feature}/domain/entities/{feature}_entity.dart"),
        f"""class {class_name}Entity {{
  final int id;

  {class_name}Entity({{required this.id}});
}}
"""
    )

    # Repository Interface
    create_file(
        os.path.join(base_path, f"{feature}/domain/repositories/{feature}_repository.dart"),
        f"""abstract class {class_name}Repository {{
  Future<void> get{class_name}();
}}
"""
    )

    # Use Case
    create_file(
        os.path.join(base_path, f"{feature}/domain/use_cases/get_{feature}.dart"),
        f"""import '../repositories/{feature}_repository.dart';

class Get{class_name} {{
  final {class_name}Repository repository;

  Get{class_name}(this.repository);

  Future<void> call() async {{
    return repository.get{class_name}();
  }}
}}
"""
    )

    # Model
    create_file(
        os.path.join(base_path, f"{feature}/data/models/{feature}_model.dart"),
        f"""import '../../domain/entities/{feature}_entity.dart';

class {class_name}Model extends {class_name}Entity {{
  {class_name}Model({{required super.id}});

  factory {class_name}Model.fromJson(Map<String, dynamic> json) {{
    return {class_name}Model(
      id: json['id'],
    );
  }}
}}
"""
    )

    # Repository Impl
    create_file(
        os.path.join(base_path, f"{feature}/data/repositories/{feature}_repository_impl.dart"),
        f"""import '../../domain/repositories/{feature}_repository.dart';

class {class_name}RepositoryImpl implements {class_name}Repository {{
  @override
  Future<void> get{class_name}() async {{
    // TODO: implement
  }}
}}
"""
    )

    # DataSource
    create_file(
        os.path.join(base_path, f"{feature}/data/datasources/{feature}_remote_datasource.dart"),
        f"""class {class_name}RemoteDataSource {{
  Future<void> fetchData() async {{
    // API call here
  }}
}}
"""
    )

    # Controller (NEW 🔥)
    create_file(
        os.path.join(base_path, f"{feature}/presentation/controller/{feature}_controller.dart"),
        f"""class {class_name}Controller {{
  // TODO: add logic (Cubit / Bloc / Controller)
}}
"""
    )

    # View
    create_file(
        os.path.join(base_path, f"{feature}/presentation/view/{feature}_view.dart"),
        f"""import 'package:flutter/material.dart';

class {class_name}View extends StatelessWidget {{
  const {class_name}View({{super.key}});

  @override
  Widget build(BuildContext context) {{
    return Scaffold(
      appBar: AppBar(title: const Text('{class_name}')),
      body: const Center(
        child: Text('{class_name} View'),
      ),
    );
  }}
}}
"""
    )

    print(f"\n✨ Feature '{feature}' created successfully!\n")


def main():
    print("=" * 50)
    print("   Flutter Feature Generator 🔥")
    print("=" * 50)

    default_path = os.path.join(os.getcwd(), "lib", "features")

    base_path_input = input(
        f"\n📂 Enter features base path\n   (press Enter for default: {default_path})\n   > "
    ).strip()

    base_path = base_path_input if base_path_input else default_path

    if not os.path.exists(base_path):
        create_it = input(
            f"\n⚠️ Path doesn't exist: {base_path}\nCreate it? (y/n): "
        ).strip().lower()
        if create_it == "y":
            os.makedirs(base_path, exist_ok=True)
            print(f"✅ Created base path: {base_path}")
        else:
            print("❌ Cancelled.")
            return

    while True:
        feature_name = input("\n✏️ Enter feature name: ").strip()
        if feature_name:
            break
        print("⚠️ Feature name cannot be empty!")

    create_feature(base_path, feature_name)

    while True:
        another = input("➕ Create another feature? (y/n): ").strip().lower()
        if another == "y":
            feature_name = input("\n✏️ Enter feature name: ").strip()
            if feature_name:
                create_feature(base_path, feature_name)
        else:
            print("\n👋 Done!\n")
            break


if __name__ == "__main__":
    main()
#python create_feature.py