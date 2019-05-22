package com.aomi.nani.tagrules;

import org.sitemesh.SiteMeshContext;
import org.sitemesh.content.ContentProperty;
import org.sitemesh.content.tagrules.TagRuleBundle;
import org.sitemesh.content.tagrules.html.ExportTagToContentRule;
import org.sitemesh.tagprocessor.State;

public class WrapperTagRuleBundle implements TagRuleBundle {
    @Override
    public void install(State state, ContentProperty contentProperty, SiteMeshContext siteMeshContext) {
        state.addRule("wrapper", new ExportTagToContentRule(siteMeshContext, contentProperty.getChild("wrapper"), false));
    }

    @Override
    public void cleanUp(State state, ContentProperty contentProperty, SiteMeshContext siteMeshContext) {
        if (!((ContentProperty) contentProperty.getChild("wrapper")).hasValue()) {
            ((ContentProperty) contentProperty.getChild("wrapper")).setValue(contentProperty.getValue());
        }
    }

}
