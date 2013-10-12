varying vec3 N;
varying vec3 v;   
void main (void) {
   vec3 L = normalize(gl_LightSource[0].position.xyz - v);   
   vec3 E = normalize(-v);  
   vec3 R = normalize(reflect(L,N));  

   vec4 Iamb = gl_FrontLightProduct[0].ambient;    

   vec4 Idiff = gl_FrontLightProduct[0].diffuse * max(dot(N,L), 0.0);
   Idiff = clamp(Idiff, 0.0, 1.0);

   vec4 Ispec = gl_FrontLightProduct[0].specular 
                * pow(max(dot(R,E),0.0),gl_FrontMaterial.shininess);
   Ispec = clamp(Ispec, 0.0, 1.0);

   vec4 color = gl_FrontLightModelProduct.sceneColor + Iamb + Idiff + Ispec;
   vec3 lightWeighting = color.rgb;
   
	gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
    if (length(lightWeighting) < 1.00) {
        if (mod(gl_FragCoord.x + gl_FragCoord.y, 10.0) == 0.0) {
            gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
        }
    }
    if (length(lightWeighting) < 0.75) {
        if (mod(gl_FragCoord.x - gl_FragCoord.y, 10.0) == 0.0) {
            gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
        }
    }
    if (length(lightWeighting) < 0.50) {
        if (mod(gl_FragCoord.x + gl_FragCoord.y - 5.0, 10.0) == 0.0) {
            gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
        }
    }

    if (length(lightWeighting) < 0.3465) {
        if (mod(gl_FragCoord.x - gl_FragCoord.y - 5.0, 10.0) == 0.0) {
            gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
        }
    }        
}
