import 'package:mason/mason.dart';
import 'package:mason_utils/utils/get_package_name.dart';

Future<void> run(HookContext context) async {
  // parse "name: testing_site" from pubspec.yaml
  final name = await getPackageName(context);
  context.logger.info('Project name: $name');

  // update context.vars['projectName'] with the value of "name: testing_site"
  context.vars['projectName'] = name;
}
