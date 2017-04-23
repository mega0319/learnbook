if (self.CavalryLogger) { CavalryLogger.start_js(["HiDvb"]); }

__d('MakeProfilePicInit',['ProfilePicCropViewerInit','URI'],(function a(b,c,d,e,f,g){var h={handleOptimus:function i(j,k,l){l.prevent();var m=new (c('URI'))(k.getAttribute('ajaxify')||k.href).getQueryData();c('ProfilePicCropViewerInit').loadID(m.fbid,m.profile_id,{source:m.pp_source,stickerID:m.sticker_id});}};f.exports=h;}),null);