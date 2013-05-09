(function() {
  tinymce.PluginManager.requireLangPack('uploaddocument');
  tinymce.create('tinymce.plugins.UploadDocumentPlugin', {
    init: function(ed, url) {
      ed.addCommand('mceUploadDocument', function() {
        return ed.windowManager.open({
          file: url + '/dialog.html',
          width: 350 + parseInt(ed.getLang('uploaddocument.delta_width', 0)),
          height: 180 + parseInt(ed.getLang('uploaddocument.delta_height', 0)),
          inline: 1
        }, {
          plugin_url: url
        });
      });
      ed.addButton('uploaddocument', {
        title: 'uploaddocument.desc',
        cmd: 'mceUploadDocument',
        image: url + '/img/uploaddocument.png'
      });
      return ed.onNodeChange.add(function(ed, cm, n) {
        return cm.setActive('uploaddocument', n.nodeName === 'IMG');
      });
    },
    createControl: function(n, cm) {
      return null;
    },
    getInfo: function() {
      return {
        longname: 'UploadDocument plugin',
        author: 'Per Florent Morin (based on work done by Christian B. Viken for image upload plugin)',
        authorurl: 'https://github.com/florentmorin',
        infourl: 'https://github.com/florentmorin/tinymce-rails-documentupload',
        version: '1.0'
      };
    }
  });
  return tinymce.PluginManager.add('uploaddocument', tinymce.plugins.UploadDocumentPlugin);
})();