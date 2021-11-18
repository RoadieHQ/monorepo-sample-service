require 'yaml'

paths = []

1.upto(200) do |i|
  data = {
    'apiVersion' => 'backstage.io/v1alpha1',
    'kind' => 'Component',
    'metadata' => {
      'name' => "service-#{i}",
      'title' => "Service #{i}",
      'description' => "Component for Backstage #{i}",
      'annotations' => {
        'github.com/project-slug' => 'RoadieHQ/monorepo-sample-service',
      },
    },
    'spec' => {
      'type' => 'service',
      'owner' => 'engineering',
      'lifecycle' => 'experimental',
    }
  }

  path = "./generated-index-files/service-index-#{i}.yml"
  File.open(path, 'w') { |f| YAML.dump(data, f) }
  paths << path
end

location = {
  'apiVersion' => 'backstage.io/v1alpha1',
  'kind' => 'Location',
  'metadata' => {
    'name' => "monorepo-sample-service",
  },
  'spec' => {
    'type' => 'url',
    'targets' => paths,
  }
}

File.open('./catalog-info.yaml', 'w') { |f| YAML.dump(location, f) }
