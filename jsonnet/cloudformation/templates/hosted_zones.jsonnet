local api = {
  templateName:: (
    local fullPath = std.thisFile;
    local splitPath = std.split(fullPath, '/');
    local fileName = splitPath[std.length(splitPath) - 1];
    std.strReplace(fileName, '.jsonnet', '.yml')
  ),
  templatePath:: 'cloudformation/templates/' + self.templateName,
  HostedZone(name=''):: {
    name: name,
    toSlug():: std.join('', std.split(self.name, '.')),
    toResource():: (
      local me = self;
      {
        Type: 'AWS::Route53::HostedZone',
        DeletionPolicy: 'Retain',
        Properties: {
          Name: me.name,
        },
      }
    ),
  },
  zones:: (
    local me = self;
    {
      astuary: me.HostedZone('astuaryart.com.'),
      blog: me.HostedZone('alexrecker.com.'),
      bob: me.HostedZone('bobrosssearch.com.'),
      cookbook: me.HostedZone('thereckerfamilycookbook.com.'),
      family: me.HostedZone('reckerfamily.com.'),
      tranquility: me.HostedZone('tranquilitydesignsmn.com.'),
      wedding: me.HostedZone('alexandmarissa.com.'),
    }
  ),
  resources:: (
    local me = self;
    {
      [me.zones[key].toSlug()]: me.zones[key].toResource()
      for key in std.objectFields(me.zones)
    }
  ),
};

api {
  [api.templatePath]: std.manifestYamlStream([{
    Resources: api.resources,
  }]),
}
