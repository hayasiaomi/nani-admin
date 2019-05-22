package com.aomi.nani.filter;

import com.aomi.nani.tagrules.WrapperTagRuleBundle;
import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class MeshsiteFilter extends ConfigurableSiteMeshFilter {
    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
        builder.addDecoratorPath("/*", "/decorator/default")//拦截规则，/decorator/default 会被转发
                .addExcludedPath("/static/**")
                .addTagRuleBundle(new WrapperTagRuleBundle());
    }
}

