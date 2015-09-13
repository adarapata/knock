#//= require three
document.addEventListener 'DOMContentLoaded', ->
  scene = undefined
  camera = undefined
  renderer = undefined
  geometry = undefined
  material = undefined
  mesh = undefined

  init = ->
    scene = new (THREE.Scene)
    camera = new (THREE.PerspectiveCamera)(75, window.innerWidth / window.innerHeight, 1, 10000)
    camera.position.z = 1000
    geometry = new (THREE.BoxGeometry)(200, 200, 200)
    texture = THREE.ImageUtils.loadTexture('assets/block.png');
    material = new (THREE.MeshBasicMaterial)(
      map: texture )
    mesh = new (THREE.Mesh)(geometry, material)
    scene.add mesh
    renderer = new (THREE.WebGLRenderer)
    renderer.setSize window.innerWidth, window.innerHeight
    document.body.appendChild renderer.domElement
    return

  animate = ->
    requestAnimationFrame animate
    mesh.rotation.x += 0.01
    mesh.rotation.y += 0.02
    renderer.render scene, camera
    return

  init()
  animate()
  return

# ---
# generated by js2coffee 2.1.0
