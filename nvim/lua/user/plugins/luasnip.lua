local ls = require('luasnip')

ls.config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI',
})

ls.add_snippets('php', {
  ls.parser.parse_snippet('class', 'class $1\n{\n    $0\n}'),
  ls.parser.parse_snippet('pubf', 'public function $1($2): $3\n{\n\t$0\n}'),
  ls.parser.parse_snippet('prif', 'private function $1($2): $3\n{\n\t$0\n}'),
  ls.parser.parse_snippet('prof', 'protected function $1($2): $3\n{\n\t$0\n}'),
  ls.parser.parse_snippet('testf', '/** @test */\npublic function it_$1()\n{\n\t$0\n}'),
})

ls.add_snippets('typescript', {
  ls.parser.parse_snippet('import', "import $1 from '$0'"),
  ls.parser.parse_snippet('cls', "console.log('$0')"),
  ls.parser.parse_snippet('clo', "console.log({ $0 })")
})

ls.add_snippets('vue', {
  ls.parser.parse_snippet('defineProps', 'defineProps<{\n  $0\n}>()'),
})
