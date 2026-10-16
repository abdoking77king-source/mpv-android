//!PARAM A
//!DESC Anime4K-v4.0-Restore-CNN-M (Adreno 610 Optimized)
//!HOOK MAIN
//!BIND HOOKED
//!WHEN COMPONENT_POS
//!SAVE TEXTURE

vec4 hook() {
    vec2 tc = HOOKED_pos;
    vec4 c = HOOKED_tex(tc);
    
    vec4 north = HOOKED_tex(tc + vec2(0.0, -HOOKED_pt.y));
    vec4 south = HOOKED_tex(tc + vec2(0.0, HOOKED_pt.y));
    vec4 east  = HOOKED_tex(tc + vec2(HOOKED_pt.x, 0.0));
    vec4 west  = HOOKED_tex(tc + vec2(-HOOKED_pt.x, 0.0));
    
    vec4 edge = abs(north - south) + abs(east - west);
    return c + edge * 0.12;
}
