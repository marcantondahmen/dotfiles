/**
 * Based on https://github.com/yazi-rs/flavors/tree/d04a298a8d4ada755816cb1a8cfb74dd46ef7124/scripts
 *
 * Run node generate-flavor.js in order to create a flavor.
 */
import { access, mkdir, readFile, writeFile } from 'node:fs/promises';
import { join } from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = fileURLToPath(new URL('.', import.meta.url));

const VARIANTS = {
	'Tokyo Night Storm': {
		text: '#c0caf5',
		background: '#24283b',

		primary: '#7aa2f7',
		secondary: '#73daca',
		tertiary: '#ff9e64',
		accent: '#bb9af7',

		surface: '#414868',
		surface1: '#545c7e',
		surface2: '#1f2335',

		onSurface: '#a9b1d6',
		onSurface1: '#737aa2',
		onSurface2: '#545c7e',

		red: '#f7768e',
		green: '#41a6b5',
		blue: '#7aa2f7',
		yellow: '#e0af68',
	},
};

const template = await readFile(join(__dirname, './template.toml'), 'utf8');

for (const [name, colors] of Object.entries(VARIANTS)) {
	const lowerName = name.toLowerCase().replace(/ /g, '-');
	const wd = join(__dirname, `../flavors/${lowerName}.yazi`);
	try {
		await access(wd);
	} catch {
		await mkdir(wd, { recursive: true });
	}

	let s = template;

	for (const [name, color] of Object.entries(colors)) {
		s = s.replaceAll(`\${${name}}`, color);
	}

	await writeFile(
		join(wd, 'flavor.toml'),
		s.replaceAll('${variant}', lowerName),
	);
}
