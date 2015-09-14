#//= require three
#//= require rx.lite
document.addEventListener 'DOMContentLoaded', ->
  scene = undefined
  camera = undefined
  renderer = undefined
  geometry = undefined
  material = undefined
  mesh = undefined
  texture1 = undefined
  texture2 = undefined

  init = ->
    scene = new (THREE.Scene)
    camera = new (THREE.PerspectiveCamera)(75, window.innerWidth / window.innerHeight, 1, 10000)
    camera.position.z = 1000
    geometry = new (THREE.BoxGeometry)(200, 200, 200)
    texture1 = THREE.ImageUtils.loadTexture('images/block.png');
    texture2 = THREE.ImageUtils.loadTexture('images/retro_efb.png');
    material = new (THREE.MeshBasicMaterial)(
      map: texture1 )
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

  source = Rx.Observable.timer(1000, 500)
           .select((x, idx, obs)-> return 1)
           .scan((acc, current)-> return acc + current)
  source.subscribe((x) ->
    if (x % 2 == 0)
      mesh.material.map = texture1
    else
      mesh.material.map = texture2
    )
  return

# ---
# generated by js2coffee 2.1.0
