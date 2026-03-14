# pandoc-japanese

`pandoc`、`pandoc-crossref`、および `texlive-full` を含む、日本語文書作成向けの Docker イメージです。

## 特徴

- **ベースイメージ**: `mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04` (Ubuntu 22.04)
- **マルチアーキテクチャ対応**: `linux/amd64` と `linux/arm64` の両方のプラットフォームで利用可能です。
- **インストール済みソフトウェア**:
  - `pandoc` (v3.8.2.1)
  - `pandoc-crossref` (v0.3.22a)
  - `texlive-full`
  - ユーティリティ: `vim`, `neofetch`

## 使い方

GitHub Container Registry (ghcr.io) からイメージをプルして利用できます。

```bash
docker pull ghcr.io/OWNER/pandoc-japanese:latest
```
*(注: `OWNER` の部分は実際のリポジトリオーナー名に置き換えてください)*

### 実行例

カレントディレクトリをマウントしてインタラクティブに実行する場合:

```bash
docker run --rm -it -v $(pwd):/workspace -w /workspace ghcr.io/OWNER/pandoc-japanese:latest bash
```

### Dev Containers での利用

ベースイメージが VS Code Dev Containers 向けであるため、`.devcontainer/devcontainer.json` で直接指定して利用することも可能です。

```json
{
  "image": "ghcr.io/OWNER/pandoc-japanese:latest",
  "customizations": {
    "vscode": {
      "extensions": [
        "James-Yu.latex-workshop"
      ]
    }
  }
}
```

## GitHub Actions でのビルドについて

このプロジェクトは GitHub Actions を使用して、マルチアーキテクチャ (`amd64`, `arm64`) の Docker イメージを自動ビルドし、ghcr.io へ公開しています。
また、発行されたイメージは `cosign` を用いて署名されています。
